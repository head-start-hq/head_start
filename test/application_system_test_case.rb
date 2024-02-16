require "test_helper"

Capybara.always_include_port = true
Capybara.default_max_wait_time = 5
Capybara.save_path = Rails.root.join("tmp", "screenshots")
Capybara.test_id = "data-test-id"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :selenium, using: :headless_chrome, screen_size: [1400, 1400] do |option|
    option.add_argument "no-sandbox"
  end

  def within_dom_id(record, prefix = nil, &block)
    within "##{dom_id(record, prefix)}" do
      block.call
    end
  end
end
