require 'rubygems'
require 'plivo'
require 'sinatra'
include Plivo

post '/reply_to_sms/' do
    # Sender's phone number
    from_number = params[:From]
    # Receiver's phone number - Plivo number
    to_number = params[:To]
    # The text which was received
    text = params[:Text]

    params = {
        'src' => to_number,
        'dst' => from_number,
    }
    body = "Thanks, we've received your message."

    r = Response.new()
    r.addMessage(body, params)
    # Print the XML
    puts r.to_xml()

    # Return the XML
    content_type 'text/xml'
    return r.to_s()
end
