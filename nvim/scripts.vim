if did_filetype()
  finish
endif

if getline(1) =~ '^#!.*\<node\>'
  setfiletype javascript
elsif getline(1) =~ '^#!.*\<ruby\>'
  setfiletype ruby
elsif getline(1) =~ '^#!.*\<python\>'
  setfiletype python
elsif getline(1) =~ '^#!.*\<bash\>'
  setfiletype bash
endif
