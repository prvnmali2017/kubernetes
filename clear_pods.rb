require 'yaml'
require 'open3'

def run_command(cmd_text)
  Open3.popen3(cmd_text) do |stdin, stdout, stderr, wait_thr|
    exit_status = wait_thr.value
    if exit_status != 0
      puts stderr.read
      abort
    else
      puts stdout.read
    end
  end
end

#Kubectl get all failed pods
#Store this in "todelete.yaml"
generate_file_cmd = "kubectl get pods --field-selector=status.phase=Failed --all-namespaces --show-all -o yaml > todelete.yaml"
puts "Generating manifest for deletion..."
run_command generate_file_cmd

puts "Manifest created, beginning to delete pods..."
#Load the file we created earlier
delete_file = YAML.load_file("todelete.yaml")
#iterate over all pods and delete them one-bye-one
delete_file["items"].each do |pod|
  namespace = pod["metadata"]["namespace"]
  pod_name = pod["metadata"]["name"]
  puts "Attempting to delete pod: #{pod_name} in namespace: #{namespace}"
  delete_cmd = "kubectl delete pod -n #{namespace} #{pod_name}"
  run_command delete_cmd
  puts "Successfully deleted."
end
