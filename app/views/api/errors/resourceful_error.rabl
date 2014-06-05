object false
node(:errors) { @resource.errors.map{ |attr, message| { message:  message } } }