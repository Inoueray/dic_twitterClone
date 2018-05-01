class BlogMailer < ApplicationMailer
  def blog_mail(blog)
    @blog = blog
    mail to: blog.user.email, subject: "投稿完了メール"
  end
end
