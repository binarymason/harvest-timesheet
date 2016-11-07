#! /usr/bin/env ruby

require 'watir'
require 'dotenv'

Dotenv.load

class TimeSheetSubmitter
  attr_reader :browser, :timesheet_url, :base_url

  def initialize
    @browser = Watir::Browser.new :chrome
    @base_url = ENV['HARVEST_URL']
    @timesheet_url = load_timesheet_url
  end

  def login
    browser.goto base_url
    browser.text_field(id: 'email').set ENV['HARVEST_EMAIL']
    browser.text_field(id: 'password').set ENV['HARVEST_PASSWORD']
    browser.button(id: 'log-in').click
  end

  def go_to_last_weeks_timesheet
    browser.goto timesheet_url
  end

  def submit_last_weeks_timesheet
    browser.button(class_name: 'button submit-link').click
  end

  def confirm_submission
    browser.button(class_name: 'button-primary js-submit-for-approval').click
  end

  private

  def load_timesheet_url
    "#{base_url}/time/week/#{last_sunday_date_path}"
  end

  def last_sunday_date_path
    today = Date.today
    this_sunday = today - today.wday
    last_sunday = this_sunday - 7

    yyyy = last_sunday.year
    mm = last_sunday.month
    dd = last_sunday.day

    "#{yyyy}/#{mm}/#{dd}"
  end
end

worker = TimeSheetSubmitter.new
worker.login
worker.go_to_last_weeks_timesheet
worker.submit_last_weeks_timesheet
worker.confirm_submission
