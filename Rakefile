require 'rake'

desc 'Hook dotfiles into system'
task :install  => :sublime do
    switch_to_zsh
    linkables = Dir.glob('*/**{.symlink}')

    skip_all = false
    overwrite_all = false
    backup_all = false

    linkables.each do |linkable|
        file = linkable.split('/').last.split('.symlink').last
        target = "#{ENV["HOME"]}/.#{file}"
        
        if File.exists?(target) || File.symlink?(target)
          unless skip_all || overwrite_all || backup_all
            puts "File already exists: #{target}, what do you want to do? [s]kip, [S]kip all, [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all"
            case STDIN.gets.chomp
            when 'o' then overwrite = true
            when 'b' then backup = true
            when 'O' then overwrite_all = true
            when 'B' then backup_all = true
            when 'S' then skip_all = true
            end
        end
        
        FileUtils.rm_rf(target) if overwrite || overwrite_all
        `mv "$HOME/.#{file}" "$HOME/.#{file}.backup"` if backup || backup_all
    end
    system `ln -s "$PWD/#{linkable}" "#{target}"`
end
end

desc 'Remove dotfiles from system'
task :remove do
    switch_to_batch
    linkables = Dir.glob('*/**{.symlink}')

    linkables.each do |linkable|
        file = linkable.split('/').last.split('.symlink').last
        target = "#{ENV["HOME"]}/.#{file}"

        if File.symlink?(target)
            FileUtils.rm(target)
        end

        if File.exists?("#{ENV["HOME"]}/.#{file}.backup")
            `mv "$HOME/.#{file}.backup" "$HOME/.#{file}"` 
        end
    end

    settings = Dir.glob('sublime2/*')
    sublime_path ="#{ENV["HOME"]}/Library/Application\ Support/Sublime\ Text\ 2/Packages/User"
    settings.each do |setting|
        file = setting.split('/').last
        target = "#{sublime_path}/#{file}"

        if File.exists?("#{target}.backup")
            `mv "#{target}.backup" "#{target}"`
        end
    end
    
end

desc 'Sublime2 settings'
task :sublime do
    settings = Dir.glob('sublime2/*')
    sublime_path ="#{ENV["HOME"]}/Library/Application\ Support/Sublime\ Text\ 2/Packages/User"

    settings.each do |setting|

        file = setting.split('/').last
        target = "#{sublime_path}/#{file}"
        `mv "#{target}" "#{target}.backup"`
        
        system `ln -s "$PWD/#{setting}" "#{target}"`
    end

end

def switch_to_zsh

    if ENV["SHELL"] !~ /zsh/
        system %Q{chsh -s `which zsh`}
    end

end

def switch_to_batch

    if ENV["SHELL"] =~ /zsh/
        system %Q{chsh -s `which bash`}
    end

end

task :default => 'install'