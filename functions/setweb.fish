function setweb
    # 设置默认端口为7890
    set -l port 18080

    # 如果有参数，则使用参数作为端口号
    if test (count $argv) -gt 0
        set port $argv[1]
    end

    # 设置http_proxy和https_proxy环境变量
    set -gx http_proxy "http://localhost:$port"
    set -gx https_proxy "http://localhost:$port"

    # 输出提示
    echo "Proxy has been set to port $port"
end
