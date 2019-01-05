<?php
/**
 * Created by PhpStorm.
 * User: 何泽-hz
 * Date: 2018/12/25
 * Time: 11:42
 */

namespace phpmailer\src;

use phpmailer\src\PHPMailer;
use phpmailer\src\Exception;

class EmailAddon
{

    public static $HOST = 'smtp.qq.com'; // QQ 邮箱的服务器地址
    public static $PORT = 465; // smtp 服务器的远程服务器端口号
    public static $SMTP = 'ssl'; // 使用 ssl 加密方式登录
    public static $CHARSET = 'UTF-8'; // 设置发送的邮件的编码

    private static $USERNAME = '123456789@qq.com'; // 授权登录的账号
    private static $PASSWORD = 'znm**********ieb'; // 授权登录的密码
    private static $NICKNAME = '发件人的昵称'; // 发件人的昵称

    /**
     * QQMailer constructor.
     * @param bool $debug [调试模式]
     */
    public function __construct($debug = false)
    {
        $this->mailer = new PHPMailer();
        $this->mailer->SMTPDebug = $debug ? 1 : 0;
        $this->mailer->isSMTP(); // 使用 SMTP 方式发送邮件
    }

    public function set_config ($data)
    {
        self::$HOST = $data['smtp_url'];
        self::$PORT = $data['smtp_port'];
        self::$USERNAME = $data['smtp_email'];
        self::$PASSWORD = $data['smtp_pwd'];
        self::$NICKNAME = $data['sender'];
    }

    /**
     * @return PHPMailer
     */
    public function getMailer()
    {
        return $this->mailer;
    }

    private function loadConfig()
    {
        /* Server Settings  */
        $this->mailer->SMTPAuth = true; // 开启 SMTP 认证
        $this->mailer->Host = self::$HOST; // SMTP 服务器地址
        $this->mailer->Port = self::$PORT; // 远程服务器端口号
        $this->mailer->SMTPSecure = self::$SMTP; // 登录认证方式
        /* Account Settings */
        $this->mailer->Username = self::$USERNAME; // SMTP 登录账号
        $this->mailer->Password = self::$PASSWORD; // SMTP 登录密码
        $this->mailer->From = self::$USERNAME; // 发件人邮箱地址
        $this->mailer->FromName = self::$NICKNAME; // 发件人昵称（任意内容）
        /* Content Setting  */
        $this->mailer->isHTML(true); // 邮件正文是否为 HTML
        $this->mailer->CharSet = self::$CHARSET; // 发送的邮件的编码
    }

    /**
     * Add attachment
     * @param $path [附件路径]
     */
    public function addFile($path)
    {
        $this->mailer->addAttachment($path);
    }


    /**
     * Send Email
     * @param $email [收件人]
     * @param $title [主题]
     * @param $content [正文]
     * @return bool [发送状态]
     */
    public function send($email, $title, $content)
    {
        $data['email'] = $email;
        $data['title'] = $title;
        $data['content'] = $content;
        $this->loadConfig();
        $this->mailer->addAddress($email); // 收件人邮箱
        $this->mailer->Subject = $title; // 邮件主题
        $this->mailer->Body = $content; // 邮件信息
        return (bool)$this->mailer->send(); // 发送邮件
    }

}