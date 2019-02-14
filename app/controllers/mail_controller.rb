require 'mailgun'
class MailController < ApplicationController
  before_action :authenticate_user!, except: [:home]
  
  def index
  end
  
  def main
    @mailposts = Mailpost.all
  end

  def write
    @mailpost = Mailpost.new
    @mailpost.title = params[:title] #post_title이라는 이름의 내용을 title 행에 저장
    @mailpost.email = params[:email]
    @mailpost.content = params[:content]
    @mailpost.save
    
    
    @title = params[:title]
    @email = params[:email]
    @content = params[:content]
    
    mg_client = Mailgun::Client.new("key-eae2e00ca53d87ea89a39d128ba248a3") #domins-domain name-api key 에 있는거 () 에 ㅂㄱ붙
    
    message_params =  {
                   from: 'deg9810@naver.com',
                   to:   @email, # 위에서 파람즈로 받았으니까
                   subject: @title,
                   text:    @content 
                  }
    
    result = mg_client.send_message('sandboxbb0a1cfbcdf044e49f7ef9e8a07aa110.mailgun.org', message_params).to_h!
    #''안에 있는건 DOMAIN INFORMATION 위에 있는거!
    
    message_id = result['id']
    message = result['message']
  end
end
