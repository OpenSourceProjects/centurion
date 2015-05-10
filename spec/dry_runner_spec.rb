require 'spec_helper'
require 'centurion/dry_runner'

describe Centurion::DryRunner do
  subject! { described_class.new(env).send(:result) }

  context 'with a configuration' do
    let!(:env) { {
      current_environment: 'staging',
      'staging' => {
        hosts: %w(abc),
        env_vars: [],
        port_bindings: []
      }
    } }

    it 'works' do
      expect(subject).to eql 'docker -H=tcp://abc:2375 run'
    end
  end
end
