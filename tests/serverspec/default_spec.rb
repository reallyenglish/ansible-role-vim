require "spec_helper"
require "serverspec"

package = "vim"
additional_packages = []

describe package(package) do
  it { should be_installed }
end

describe command("vim --version") do
  its(:exit_status) { should eq 0 }
  its(:stdout) { should match(/^VIM\s/) }
  its(:stderr) { should eq "" }
end

additional_packages.each do |p|
  describe package(p) do
    it { should be_installed }
  end
end
