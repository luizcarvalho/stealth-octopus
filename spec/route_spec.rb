# coding: utf-8
# frozen_string_literal: true

require File.expand_path(File.dirname(__FILE__) + '/spec_helper')


describe 'StealthOctopus::Route' do
  before(:context) do
    StealthOctopus::Route.match(/\d/, flow: 'hello', state: 'say_hello')
  end

  it '.routes' do
    expect(StealthOctopus::Route.routes.size).to eq 1
  end

  it '#flow' do
    route = StealthOctopus::Route.routes.first
    expect(route.flow).to eq 'hello'
  end

  it '#dispatch true' do
    bot = double('bot')
    allow(bot).to receive(:step_to)

    expect(StealthOctopus::Route.dispatch(bot, '1')).to be true
  end


  it '#dispatch false' do
    bot = double('bot')
    allow(bot).to receive(:step_to)

    expect(StealthOctopus::Route.dispatch(bot, 'a')).to be false
  end

end
