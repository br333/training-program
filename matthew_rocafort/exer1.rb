class Domain
  attr_accessor :dom_name

  RESTRICTED_DOMAINS = [
    'google.com.ph',
	'google.ph',
	'watercup.net.ph',
	'watr.com.ph',
	'water.ph',
	'water.com.ph',
	'googlemask.ph',
	'go0gl3mask.ph',
	'goglemaske.com.ph',
	'wheninrome.com.ph',
	'wheninrone.com.ph',
	'iotechnologies.com.ph',
	'itlog.ph',
	'i0tehnologies.com.ph',
	'waiter.com.ph',
	'lenvovo.org.ph',
	'orgnanization.org.ph',
	'organization.org.ph'
  ]

  def initialize(dom_name)
    self.dom_name = dom_name
  end

  def search
    if !RESTRICTED_DOMAINS.include?(self.dom_name)
      'Domain available.'
    else
      'Domain unavailable.'
    end
  end
end