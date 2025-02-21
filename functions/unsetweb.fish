function unsetweb
    # 移除 http_proxy 和 https_proxy 环境变量
    set -e http_proxy
    set -e https_proxy

    # 输出提示信息
    echo "HTTP and HTTPS proxy have been unset."
end
