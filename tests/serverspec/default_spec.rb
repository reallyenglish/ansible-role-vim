require "spec_helper"
require "serverspec"

package = "vim"
additional_packages = []

case os[:family]
when "redhat"
  package = "vim-minimal"
  additional_packages = ["protobuf-vim"]
when "ubuntu"
  package = "vim-nox"
  additional_packages = ["vim-scripts"]
when "openbsd"
  additional_packages = ["vim-spell-uk"]
when "freebsd"
  package = "vim-lite"
  additional_packages = ["shells/tcshrc"]
end

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
