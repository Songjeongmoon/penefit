package com.penefit.moons.domain;

import lombok.Data;

@Data
public class QnAVO {
   private int qna_num;
   
   private String member_id;
   private String qna_title;
   private String qna_content;
   private String qna_status;
   private String qna_regdate;
   private String reply;
   private String qna_type;
}