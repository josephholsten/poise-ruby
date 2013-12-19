require 'chefspec'
require 'fauxhai'
require 'chefspec/berkshelf'

describe 'ruby::default' do
  before do
    @runner = ChefSpec::Runner.new(platform: 'ubuntu', version: '12.04')
  end
  describe 'default (1.9)' do
    before do
      @chef_run = @runner.converge 'ruby::default'
    end
    subject { @chef_run }
    it { should install_package 'ruby1.9.1' }
    it { should install_package 'ruby1.9.1-dev' }
  end
  describe '1.8' do
    before do
      @runner.node.set['ruby']['version'] = '1.8'
      @chef_run = @runner.converge 'ruby::default'
    end
    subject { @chef_run }
    it { should install_package 'ruby1.8' }
    it { should install_package 'ruby1.8-dev' }
    it { should install_package 'rubygems' }
  end
  describe '2.0' do
    before do
      # ubuntu-13.10 isn't in fauxhai yet
      # @runner = ChefSpec::Runner.new(platform: 'ubuntu', version: '13.10')
      @runner.node.set['ruby']['version'] = '2.0'
      @chef_run = @runner.converge 'ruby::default'
    end
    subject { @chef_run }
    it { should install_package 'ruby2.0' }
    it { should install_package 'ruby2.0-dev' }
  end
  describe 'compiletime' do
    before do
      @runner.node.set['ruby']['compiletime'] = true
    end
    describe 'default (1.9)' do
      before do
        @chef_run = @runner.converge 'ruby::default'
      end
      subject { @chef_run }
      it { should install_package('ruby1.9.1').at_compile_time }
      it { should install_package('ruby1.9.1-dev').at_compile_time }
    end
    describe '1.8' do
      before do
        @runner.node.set['ruby']['version'] = '1.8'
        @chef_run = @runner.converge 'ruby::default'
      end
      subject { @chef_run }
      it { should install_package('ruby1.8').at_compile_time }
      it { should install_package('ruby1.8-dev').at_compile_time }
      it { should install_package('rubygems').at_compile_time }
    end
    describe '2.0' do
      before do
        # ubuntu-13.10 isn't in fauxhai yet
        # runner = ChefSpec::Runner.new(platform: 'ubuntu', version: '13.10')
        @runner.node.set['ruby']['version'] = '2.0'
        @chef_run = @runner.converge 'ruby::default'
      end
      subject { @chef_run }
      it { should install_package('ruby2.0').at_compile_time }
      it { should install_package('ruby2.0-dev').at_compile_time }
    end
  end
end
