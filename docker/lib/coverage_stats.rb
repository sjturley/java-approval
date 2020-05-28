require 'nokogiri'

def get_coverage_data(file_name)
  doc = File.open(file_name) { |f| Nokogiri::XML(f) }
  source_files = doc.xpath("//sourcefile")

  output = ""

  source_files.each do |source_file|
    output += render_source_file(source_file) unless source_file['name'].include? 'Test'
  end

  output
end

def render_source_file(source_file)
  header_row = "#{source_file['name']} missing branches"
  output = header_row + "\n"

  if (source_file.at_css("counter[type='BRANCH']") == nil)
    output += "  No missing branches\n"
  else
    output += format_rows(source_file)
  end
  output
end

def format_rows(source_file)
  output = ""
  source_file.css('line').each do |line|
    output += format_line(line, line['mb'].to_i)
  end
  output
end

def format_line(line, missing_branch_count)
  return "" if missing_branch_count == 0

  "  Line #{line['nr']} #{missing_branch_count} missing #{pluralize("branch", missing_branch_count)}\n"
end

def pluralize(word, count)
  return "#{word}es" if count > 1

  return word
end

if __FILE__ == $0
  puts get_coverage_data ARGV[0]
end
