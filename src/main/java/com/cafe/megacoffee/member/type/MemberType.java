package com.cafe.megacoffee.member.type;

public enum MemberType {
    NONE, BUYER, MANAGER, ADMIN;

    @Override
    public String toString() {
        return name();
    }
}
