package lab.spring.sikgu.model;

public class ReviewVO {   
   

private String content_id;
   private String store_id ;
   private String content_description; 
   private String content_url ;
   private String content_type ;
   private long content_size ;
   private String content_title ;
   private String content_create_date; 
   private String face_check ;
   private String naver_check;
   private String naver_link;
   private String youtube_link;
   private String face_link;
   private String you_check;
   private String thumb_name;
   
   
public ReviewVO(String store_id, String content_description, String content_url,
            String content_type, long content_size, String content_title,String face_check,
            String naver_check) {
         this.store_id = store_id;
         this.content_description = content_description;
         this.content_url = content_url;
         this.content_type = content_type;
         this.content_size = content_size;
         this.content_title = content_title;
         this.face_check = face_check;
         this.naver_check = naver_check;
      }
   
   public ReviewVO(String content_id,String store_id, String content_description, String content_url,
         String content_type, long content_size, String content_title,  String content_create_date,String face_check,
         String naver_check) {
     this.content_id = content_id;
      this.store_id = store_id;
      this.content_description = content_description;
      this.content_url = content_url;
      this.content_type = content_type;
      this.content_size = content_size;
      this.content_title = content_title;
      this.content_create_date = content_create_date;
      this.face_check = face_check;
      this.naver_check = naver_check;
   }
   
   public ReviewVO(String content_id, String store_id, String content_description, String content_url,
         String content_type, long content_size, String content_title, String content_create_date, String face_check,
         String naver_check, String naver_link, String youtube_link, String face_link,String thumb_name) {
      this.content_id = content_id;
      this.store_id = store_id;
      this.content_description = content_description;
      this.content_url = content_url;
      this.content_type = content_type;
      this.content_size = content_size;
      this.content_title = content_title;
      this.content_create_date = content_create_date;
      this.face_check = face_check;
      this.naver_check = naver_check;
      this.naver_link = naver_link;
      this.youtube_link = youtube_link;
      this.face_link = face_link;
     this.thumb_name = thumb_name;
   }
   
   public ReviewVO(String store_id, String content_description, String content_url,
           String content_type, long content_size, String content_title, String face_check,
           String naver_check, String face_link, String naver_link) {
        this.store_id = store_id;
        this.content_description = content_description;
        this.content_url = content_url;
        this.content_type = content_type;
        this.content_size = content_size;
        this.content_title = content_title;
        this.face_check = face_check;
        this.naver_check = naver_check;
        this.face_link = face_link;
        this.naver_link = naver_link;
        this.thumb_name = "0";
     }
  
  public ReviewVO(String store_id, String content_description, String content_url,
           String content_type, long content_size, String content_title, String face_check, String naver_check,
            String you_check, String face_link, String youtube_link, String thumb_name) {
        this.store_id = store_id;
        this.content_description = content_description;
        this.content_url = content_url;
        this.content_type = content_type;
        this.content_size = content_size;
        this.content_title = content_title;
        this.face_check = face_check;
        this.you_check = you_check;
        this.naver_check = naver_check;
        this.face_link = face_link;
        this.youtube_link = youtube_link;
        this.thumb_name = thumb_name;
     }
  
  public ReviewVO(String content_title, String face_link, String naver_link, String youtube_link) {
     this.content_title = content_title;
     this.face_link = face_link;
     this.naver_link = naver_link;
     this.youtube_link = youtube_link;
  }
   
   //getter / setter
   public String getContent_id() {return content_id;}
   public void setContent_id(String content_id) {this.content_id = content_id;}
   public String getStore_id() {return store_id;}
   public void setStore_id(String store_id) {this.store_id = store_id;}
   public String getContent_description() {return content_description;}
   public void setContent_description(String content_description) {this.content_description = content_description;}
   public String getContent_url() {return content_url;}
   public void setContent_url(String content_url) {this.content_url = content_url;}
   public String getContent_type() {return content_type;}
   public void setContent_type(String content_type) {this.content_type = content_type;}
   public long getContent_size() {return content_size;}
   public void setContent_size(long content_size) {this.content_size = content_size;}
   public String getContent_title() {return content_title;}
   public void setContent_title(String content_title) {this.content_title = content_title;}
   public String getContent_create_date() {return content_create_date;}
   public void setContent_create_date(String content_create_date) {this.content_create_date = content_create_date;}
   public String getFace_check() {return face_check;}
   public void setFace_check(String face_check) {this.face_check = face_check;}
   public String getNaver_check() {return naver_check;}
   public void setNaver_check(String naver_check) {this.naver_check = naver_check;}
   public String getNaver_link() {return naver_link;}
   public void setNaver_link(String naver_link) {this.naver_link = naver_link;}
   public String getYoutube_link() {return youtube_link;}
   public void setYoutube_link(String youtube_link) {this.youtube_link = youtube_link;}
   public String getFace_link() {return face_link;}
   public void setFace_link(String face_link) {this.face_link = face_link;}
   public String getYou_check() {return you_check;}
   public void setYou_check(String you_check) {this.you_check = you_check;}
   public String getThumb_name() {return thumb_name;}
   public void setThumb_name(String thumb_name) {this.thumb_name = thumb_name;}
}