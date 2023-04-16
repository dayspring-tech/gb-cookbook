node[:deploy].each do |application, deploy|
    if (::File.exist?("#{deploy[:deploy_to]}/current/#{deploy[:document_root]}/.htaccess-rollout"))
        script "start_maintenance" do
            interpreter "bash"
            user "root"
            cwd "#{deploy[:deploy_to]}/current/#{deploy[:document_root]}"
            code <<-EOH
                cp .htaccess .htaccess.good

                cat .htaccess-rollout >> .htaccess-temp
                cat .htaccess >> .htaccess-temp
                mv .htaccess-temp .htaccess
            EOH
        end
    end
end
