{
  config,
  lib,
  pkgs,
  ...
}: {
  services.litellm = {
    enable = true;
    environmentFile = "/home/qylad/shadow/litellm/env";
    host = "127.0.0.1";
    port = 4000;
    settings = {
      model_list = [
        {
          model_name = "local-slow";
          litellm_params = {
            model = "ollama/llama3.1:8b";
          };
        }
        {
          model_name = "local-fast";
          litellm_params = {
            model = "ollama/llama3.2:3b";
          };
        }
        {
          model_name = "minimax-m2.7";
          litellm_params = {
            model = "nvidia_nim/minimaxai/minimax-m2.7";
            api_key = "os.environ/NVIDIA_API_KEY";
          };
        }
        {
          model_name = "llama-70b";
          litellm_params = {
            model = "nvidia_nim/meta/llama-3.3-70b-instruct";
            api_key = "os.environ/NVIDIA_API_KEY";
          };
        }

        {
          model_name = "qwen-coder";
          litellm_params = {
            model = "nvidia_nim/qwen/qwen-2.5-coder-32b-instruct";
            api_key = "os.environ/NVIDIA_API_KEY";
          };
        }

        {
          model_name = "deepseek-pro";
          litellm_params = {
            model = "nvidia_nim/deepseek-ai/deepseek-v4-pro";
            api_key = "os.environ/NVIDIA_API_KEY";
          };
        }

        {
          model_name = "llama-8b";
          litellm_params = {
            model = "nvidia_nim/meta/llama-3.1-8b-instruct";
            api_key = "os.environ/NVIDIA_API_KEY";
          };
        }

        {
          model_name = "mistral-nemo";
          litellm_params = {
            model = "nvidia_nim/mistralai/mistral-nemo-12b-instruct";
            api_key = "os.environ/NVIDIA_API_KEY";
          };
        }
      ];
      litellm_settings.drop_params = true;
    };
  };
}
