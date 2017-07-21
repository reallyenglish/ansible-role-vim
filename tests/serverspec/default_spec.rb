require "spec_helper"
require "serverspec"

package = "vim"

describe package(package) do
  it { should be_installed }
end

additional_packages.each do |p|
  describe package(p) do
    it { should be_installed }
  end
end
