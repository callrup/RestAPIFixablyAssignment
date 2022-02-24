package com.java.utilities;

import com.fasterxml.jackson.annotation.JsonProperty;

public class AuthPayLoad {
	
    @JsonProperty
    private String Code;
 

    public AuthPayLoad (String Code) {
        this.Code= Code;

    }

}
