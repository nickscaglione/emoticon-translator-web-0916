require "yaml"

def load_library(path)
  load = YAML.load_file(path)
  libr = {
    "get_emoticon" => {},
    "get_meaning" => {}
  }
  load.each do |key, faces_array|
    libr["get_emoticon"][faces_array[0]] = faces_array[1]
    libr["get_meaning"][faces_array[1]] = key
  end
  libr
end

def get_japanese_emoticon(path, emoticon)
  libr = load_library(path)
  if libr["get_emoticon"][emoticon]
    libr["get_emoticon"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(path, emoticon)
  libr = load_library(path)
  if libr["get_meaning"][emoticon]
    libr["get_meaning"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end
