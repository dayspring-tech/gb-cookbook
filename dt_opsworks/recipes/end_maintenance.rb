node[:deploy].each do |application, deploy|
    if (::File.exist?("#{deploy[:deploy_to]}/current/#{deploy[:document_root]}/.htaccess.good"))
        script "end_maintenance" do
            interpreter "bash"
            user "root"
            cwd "#{deploy[:deploy_to]}/current/#{deploy[:document_root]}"
            code <<-EOH
                cp .htaccess.good .htaccess
            EOH
        end
    end
end
