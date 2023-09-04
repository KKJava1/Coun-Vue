package com.jiawa.wiki.req;

public class EbookVoteReq {
    private Long id;
    private String name;
    private Integer voteCount;
    private Double percentage;

    @Override
    public String toString() {
        return "EbookVoteReq{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", voteCount=" + voteCount +
                ", percentage=" + percentage +
                '}';
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getVoteCount() {
        return voteCount;
    }

    public void setVoteCount(Integer voteCount) {
        this.voteCount = voteCount;
    }

    public Double getPercentage() {
        return percentage;
    }

    public void setPercentage(Double percentage) {
        this.percentage = percentage;
    }
}
