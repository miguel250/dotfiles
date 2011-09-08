require 'rake'

desc 'Hook dotfile into system'
task :install do

  symlinks = Dir.glob('*/**{.symlink}')

  skip_all = false
  overwrite_all = false
  backup_all = false

  symlinks.each do |symlink|

    overwrite = false
    backup = false

    filename = symlink.split('/').last.split('.symlink').last
    target = "#{ENV["HOME"]}/.#{filename}"

    if File.exists?(target) || File.symlink?(target)
      unless skip_all || overwrite_all || backup_all
        print "File already exists: #{target}, what do you want to do? [s]kip, [S]kip all, [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all "
        case STDIN.gets.chomp
        when 'o' then overwrite = true
        when 'b' then backup = true
        when 'O' then overwrite_all = true
        when 'B' then backup_all = true
        when 'S' then skip_all = true
        end
      end
      FileUtils.rm_rf(target) if overwrite || overwrite_all
      `mv "$HOME/.#{filename }" "$HOME/.#{filename }.backup"` if backup || backup_all
    end
    `ln -s "$PWD/#{symlink}" "#{target}"`
  end
end
task :remove do

  print "Are you sure you want to uninstall dotfiles? (y/n) "
  case STDIN.gets.chomp
  when 'y' then remove = true
  when 'n' then remove = false
  end

  if remove
    symlinks = Dir.glob('*/**{.symlink}')

    symlinks.each do |symlink|
      filename = symlink.split('/').last.split('.symlink').last
      removefile = "#{ENV["HOME"]}/.#{filename}"
      FileUtils.rm_rf(removefile)

      restore = false
      skip = false
      if File.exists?("#{removefile}.backup")
        unless restore || skip
          print "Do you want to restore backup dotfiles? (y/n)"
          case STDIN.gets.chomp
          when 'y' then restore = true
          when 'n' then skip = false
          end
          if restore
            `mv "$HOME/.#{filename}.backup" "$HOME/.#{filename}"`
            FileUtils.rm_rf("#{removefile}.backup")
          end
        end
      end
    end
  end
end
task :default => 'install'
