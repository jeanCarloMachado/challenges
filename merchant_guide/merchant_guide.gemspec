# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "Merchant Guide"
  spec.version       = '1.0'
  spec.authors       = ["Jean Carlo Machado"]
  spec.email         = ["contato@jeancarlomachado.com.br"]
  spec.summary       = %q{Merchant's Guide to the Galaxy}

  spec.files         = ['lib/NAME.rb']
  spec.executables   = ['bin/NAME']
  spec.test_files    = ['tests/test_NAME.rb']
  spec.require_paths = ["lib"]
end
