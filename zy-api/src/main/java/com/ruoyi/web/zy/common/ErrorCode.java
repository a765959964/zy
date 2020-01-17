package com.ruoyi.web.zy.common;

public enum ErrorCode {

    /**
     * 功能对应编码：
     * 10000：系统成功编码
     * 20000-29999：公共信息编码
     * 30000-49999：财务后台编码
     * 50000-79999：产品信息编码
     * 80000-99999：金流信息编码
     */

    SC_10000("10000", "请求成功"),

    SC_10001("10001", "请求失败"),

    SC_20000("20000", "商户不存在"),
    SC_20001("20001", "下单金额错误"),
    SC_20002("20002", "商户验签失败"),
    SC_20003("20003", "未获取到二维码"),
    SC_20004("20004", "请上传收款码"),
    SC_20005("20005", "未找到相应的收款二维码");

    // 编码
    private String code;
    // 消息
    private String message;

    private ErrorCode(String code, String message) {
        this.code = code;
        this.message = message;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
