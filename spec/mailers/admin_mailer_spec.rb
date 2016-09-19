require 'spec_helper'

describe AdminMailer, type: :mailer do
  context 'slack invite errors' do
    subject(:mailer) { AdminMailer.failed_to_invite_user_to_slack('tansaku@gmail.com', StandardError.new('Boom!'), nil) }
    it 'sends a mail' do
      expect { subject.deliver_now }.to change { ActionMailer::Base.deliveries.length }.by(1)
    end
  end
end
