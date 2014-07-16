require 'digest/sha1'
module UserHelper

		public
		def test
				puts "ddddddd"
		end

		def hashpassword(password)
			Digest::SHA1.hexdigest(password)
		end

end
