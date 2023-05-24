class ApplicationMailer < ActionMailer::Base
  self.delivery_job = ApplicationMailerJob

  layout "mailer"
  helper :mailer
  default from: "Ad Astra Star Trek Fanfiction Archive" + "<#{ArchiveConfig.RETURN_ADDRESS}>"
end
