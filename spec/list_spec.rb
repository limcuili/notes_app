require 'list'

describe List do

  it { is_expected.to respond_to :print_menu }

  it { is_expected.to respond_to :interactive_menu }

end
