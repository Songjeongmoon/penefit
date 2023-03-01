package com.penefit.moons.domain;

import javax.validation.constraints.NotBlank;

import lombok.Data;

@Data
public class QnAVO {
   private int qna_num;
   
   @NotBlank
   private String member_id;
   
   @NotBlank
   private String qna_title;
   
   @NotBlank
   private String qna_content;
   private String qna_status;
   private String qna_regdate;
   private String reply;
   
   @NotBlank
   private String qna_type;
}