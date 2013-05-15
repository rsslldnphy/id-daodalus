Gem::Specification.new do |s|
  s.name          = 'id-daodalus'
  s.version       = '0.0.1'
  s.date          = '2013-05-15'
  s.summary       = "Id/Daodalus integration"
  s.description   = "Developed at On The Beach Ltd. Contact russell.dunphy@onthebeach.co.uk"
  s.authors       = ["Russell Dunphy"]
  s.email         = ['russell@russelldunphy.com', 'radek.molenda@gmail.com']
  s.files         = `git ls-files`.split($\)
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ["lib"]
  s.homepage      = 'http://github.com/onthebeach/id-daodalus'

  s.add_dependency "id"
  s.add_dependency "daodalus"

  s.add_development_dependency "rspec"
  s.add_development_dependency "simplecov"

end
