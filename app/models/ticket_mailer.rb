class TicketMailer < ActionMailer::Base
  
  def ticket_alert(user, ticket)
    # Sent to staff when ticket is submitted
    recipients    user.email
    from          "help@bigfolio.com"
    reply_to      "help@bigfolio.com"
    subject       "New support request (#{ticket.key}) from #{ticket.name}"
    body          :ticket => ticket
    content_type  "text/html"
  end
  
  def ticket_update(user, message, ticket)
    # Sent to staff when the customer adds info
    recipients    user.email
    from          "help@bigfolio.com"
    reply_to      "help@bigfolio.com"
    subject       "New reply from #{ticket.name} for support request [#{ticket.key}]"
    body[:message] = message
    body[:ticket]  = ticket
    content_type  "text/html"
  end
  
  def ticket_update_with_attachment(user, message, ticket)
    # Sent to staff when the customer adds info
    recipients    user.email
    from          "help@bigfolio.com"
    reply_to      "help@bigfolio.com"
    subject       "New reply from #{ticket.name} for support request [#{ticket.key}]"
    body[:message] = message
    body[:ticket]  = ticket
    content_type  "text/html"
    attachment(:content_type => message.attachment_content_type,
        :filename => message.attachment_file_name,
        :body => File.read(message.attachment.path))
  end
  
  def ticket_reply(message, ticket)
    # Sent to customer when staff submits a reply
    recipients    ticket.email
    from          "help@bigfolio.com"
    reply_to      "help@bigfolio.com"
    subject       "Update on your support request [#{ticket.key}]"
    body[:message] = message
    body[:ticket]  = ticket
    content_type  "text/html"
  end
  
  def ticket_reply_with_attachment(message, ticket) 
    # Sent to customer (with attachment) when staff submits a reply
    recipients    ticket.email
    from          "help@bigfolio.com"
    reply_to      "help@bigfolio.com"
    subject       "Update on your support request [#{ticket.key}]"
    body[:message] = message
    body[:ticket]  = ticket
    content_type  "text/html"
    attachment(:content_type => message.attachment_content_type,
        :filename => message.attachment_file_name,
        :body => File.read(message.attachment.path))
  end
  
  def ticket_confirmation(ticket) 
    # Sent to customer to confirm their submission
    recipients    ticket.email
    from          "help@bigfolio.com"
    reply_to      "help@bigfolio.com"
    subject       "Your support request [#{ticket.key}] has been recieved"
    body          :ticket => ticket
    content_type  "text/html"
  end
  
end
