package com.szdx.bean;

public class Administrator {
    private String name;
    private Integer id;
    private String password;

    @Override
    public String toString() {
        return "Administrator{" +
                "name='" + name + '\'' +
                ", id=" + id +
                ", password='" + password + '\'' +
                '}';
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
