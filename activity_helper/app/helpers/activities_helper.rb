module ActivitiesHelper
	URL_FORMATS = { regular: /^(https?:\/\/)?(www\.)?youtube.com\/watch\?(.*\&)?v=(?<id>[^&]+)/,
					shortened: /^(https?:\/\/)?(www\.)?youtu.be\/(?<id>[^&]+)/,
					embed: /^(https?:\/\/)?(www\.)?youtube.com\/embed\/(?<id>[^&]+)/,
					embed_as3: /^(https?:\/\/)?(www\.)?youtube.com\/v\/(?<id>[^?]+)/,
					chromeless_as3: /^(https?:\/\/)?(www\.)?youtube.com\/apiplayer\?video_id=(?<id>[^&]+)/ }

	INVALID_CHARS = /[^a-zA-Z0-9\:\/\?\=\&\$\-\_\.\+\!\*\'\(\)\,]/

	def has_invalid_chars?(youtube_url)
	    !INVALID_CHARS.match(youtube_url).nil?
	end

	def extract_video_id(youtube_url)
	    return nil if has_invalid_chars?(youtube_url)
	    flag = false
	    youtube_id = ""
	    URL_FORMATS.values.each do |format_regex|
	      match = format_regex.match(youtube_url)
	      if match
	      	flag = true
	      	youtube_id = match[:id]
	      	break
	      end
	    end

      	if flag
      		return youtube_id
      	else
      		return flag
      	end
	end
end
