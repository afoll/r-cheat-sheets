#Clear environment, set working directory, and run header
rm(list=ls())
setwd("/Users/georgefollett/Research")
source("/Users/georgefollett/Research/R Training/header.R")

#####################################
#Title:     
#Summary:   




library(sendmailR)


from <- "robert.andrew.follett@gmail.com"
to <- "robert.andrew.follett@gmail.com"
subject <- "Covid Update"
body <- "This is the result of the test:"                     
control=list(smtpServer="ASPMX.L.GOOGLE.COM")

sendmail(from=from,to=to,subject=subject,msg=body,control=list(smtpServer="ASPMX.L.GOOGLE.COM"))



####################################

library(mailR)

from <- "robert.andrew.follett@gmail.com"
to_1 <- "robert.andrew.follett@gmail.com"
subject <- "Covid Update"
body <- "This is the result of the test:"    

send.mail(from = from,
          to = c(to_1),
          subject = subject,
          body = body,
          smtp = list(host.name = "smtp.gmail.com", port = 465, user.name = "robert.andrew.follett", passwd = "YusterBloom429/", ssl = TRUE),
          authenticate = TRUE,
          send = TRUE,
          #attach.files = c("./download.log", "upload.log", "https://dl.dropboxusercontent.com/u/5031586/How%20to%20use%20the%20Public%20folder.rtf"),
          #file.names = c("Download log.log", "Upload log.log", "DropBox File.rtf"), # optional parameter
          #file.descriptions = c("Description for download log", "Description for upload log", "DropBox File"), # optional parameter
          debug = TRUE)





####################################

library(gmailr)

email <- gm_mime() %>%
  gm_to("user@recipient.com") %>%
  gm_from("user@sender.com") %>%
  gm_subject("Test email subject") %>%
  gm_text_body("Test email body")
  gm_attach_file("Attachment.png")


 gm_send_message(email)



####################################

library(gmailR)
gmailR::gmail(
  to =c("robert.andrew.follett@email.com"),
  subject = "Subject",
  message = "Message",
  username = "robert.andrew.follett@gmail.com",
  password = "YusterBloom429",
  #attachment = "htmlmarkdown.html"
)





