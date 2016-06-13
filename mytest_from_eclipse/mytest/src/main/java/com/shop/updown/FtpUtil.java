package com.shop.updown;

import java.io.BufferedInputStream;
import java.io.ByteArrayOutputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;

import org.apache.commons.net.ftp.FTPClient;
import org.apache.commons.net.ftp.FTPClientConfig;
import org.apache.commons.net.ftp.FTPReply;

public class FtpUtil {
    private static String OS = System.getProperty("os.name").toLowerCase();
    private FTPClient ftpClient;
    private String hostname;
    private int port;
    private String username;
    private String password;
    private String root;

    public FtpUtil(String hostname, int port, String username, String password, String root) {
        this.hostname = hostname;
        this.port = port;
        this.username = username;
        this.password = password;
        this.root = root;
        ftpClient = getClient();
    }

    public boolean ftpLogin() {
        boolean isLogin = false;
        this.ftpClient.setControlEncoding("utf-8");
        try {
            if (this.port > 0) {
                this.ftpClient.connect(this.hostname, this.port);
            } else {
                this.ftpClient.connect(this.hostname);
            }
            // FTP服务器连接回答
            int reply = this.ftpClient.getReplyCode();
            if (!FTPReply.isPositiveCompletion(reply)) {
                this.ftpClient.disconnect();
                return isLogin;
            }
            this.ftpClient.login(this.username, this.password);
            // 设置传输协议
            this.ftpClient.enterLocalPassiveMode();
            this.ftpClient.setFileType(FTPClient.BINARY_FILE_TYPE);
            isLogin = true;
        } catch (Exception e) {
        	isLogin = false;
        	return isLogin;
            //throw new ServiceException(e.getMessage(), e);
        }
        this.ftpClient.setBufferSize(1024 * 2);
        //this.ftpClient.setDataTimeout(30 * 1000);
        return isLogin;
    }

    /**
     * @退出关闭服务器链接
     * */
    public void ftpLogOut() {
        if (null != this.ftpClient && this.ftpClient.isConnected()) {
            try {
                boolean reuslt = this.ftpClient.logout();// 退出FTP服务器
                if (reuslt) {
                }
            } catch (IOException e) {
//                throw new ServiceException(e.getMessage(), e);
            	e.printStackTrace();
            } finally {
                try {
                    this.ftpClient.disconnect();// 关闭FTP服务器的连接
                } catch (IOException e) {
//                    throw new ServiceException(e.getMessage(), e);
                    e.printStackTrace();
                }
            }
        }
    }

    public boolean uploadFile(InputStream inputStream, String remoteUpLoadPath, String fileName) {
        BufferedInputStream inStream = null;
        boolean success = false;
        try {
            ftpClient.changeWorkingDirectory(root);
            //ftpClient.makeDirectory(remoteUpLoadPath);
            createDirs(remoteUpLoadPath);
            //this.ftpClient.changeWorkingDirectory(remoteUpLoadPath);// 改变工作路径
            inStream = new BufferedInputStream(inputStream);
            success = this.ftpClient.storeFile(fileName, inStream);
            if (success == true) {
                return success;
            }
        } catch (FileNotFoundException e) {
//            throw new ServiceException(e.getMessage(), e);
        	e.printStackTrace();
        } catch (IOException e) {
//            throw new ServiceException(e.getMessage(), e);
        	e.printStackTrace();
        } finally {
            if (inStream != null) {
                try {
                    inStream.close();
                } catch (IOException e) {
//                    throw new m(e.getMessage(), e);
                	e.printStackTrace();
                }
            }
        }
        return success;
    }

    public ByteArrayOutputStream downloadFile(String remoteDownLoadPath, String remoteFileName) {
        ByteArrayOutputStream outStream = null;
        boolean success = false;
        try {
            //this.ftpClient.changeWorkingDirectory(remoteDownLoadPath);
            outStream = new ByteArrayOutputStream();
            if("/".equals(root)){
                success = this.ftpClient.retrieveFile(remoteDownLoadPath + remoteFileName, outStream);
            }else{
                success = this.ftpClient.retrieveFile(root + remoteDownLoadPath + remoteFileName, outStream);
            }
            if (success == true) {
                return outStream;
            }
        } catch (Exception e) {
//            throw new ServiceException(e.getMessage(), e);
            e.printStackTrace();
        } finally {
            if (null != outStream) {
                try {
                    outStream.flush();
                    outStream.close();
                } catch (IOException e) {
//                    throw new ServiceException(e.getMessage(), e);
                	e.printStackTrace();
                }
            }
        }
        if (success == false) {
        }
        return null;
    }

    private FTPClient getClient(){
        FTPClient ftpClient = new FTPClient();
        ftpClient.setDefaultPort(port);
        ftpClient.configure(getClientConfig());
        ftpClient.setControlEncoding("utf-8");
        return ftpClient;
    }

    private static FTPClientConfig getClientConfig(){
        String sysType = null;
        if(isLinux()){
            sysType = FTPClientConfig.SYST_UNIX;
        }else if(isWindows()){
            sysType = FTPClientConfig.SYST_NT;
        }
        FTPClientConfig config = new FTPClientConfig(sysType);
        config.setRecentDateFormatStr("yyyy-MM-dd HH:mm");
        return config;
    }

    public void createDirs(String remoteUpLoadPath) throws IOException {
        String[]dirs = remoteUpLoadPath.split("/");
        for(String dir : dirs){
            this.ftpClient.mkd(dir);
            this.ftpClient.changeWorkingDirectory(dir);

        }
    }

    private static boolean isLinux(){
        return OS.indexOf("linux") >= 0;
    }

    private static boolean isWindows(){
        return OS.indexOf("windows") >= 0;
    }
}