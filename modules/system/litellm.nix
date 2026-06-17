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
    port = 15000;
    settings = {
      model_list = [
        {
          model_name = "minimax-m2.7";
          # MiniMax 230B: SWE specialist. Matches GPT-5.3-Codex for deep engineering tasks.
          litellm_params = {
            model = "nvidia_nim/minimaxai/minimax-m2.7";
            api_key = "os.environ/NVIDIA_API_KEY";
          };
        }
        {
          model_name = "llama-70b";
          # Llama 3.3 70B: Heavyweight logic & complex architecture.
          litellm_params = {
            model = "nvidia_nim/meta/llama-3.3-70b-instruct";
            api_key = "os.environ/NVIDIA_API_KEY";
          };
        }

        {
          model_name = "qwen-coder";
          # Qwen 2.5 Coder 32B: Best-in-class for heavy coding and refactoring.
          litellm_params = {
            model = "nvidia_nim/qwen/qwen-2.5-coder-32b-instruct";
            api_key = "os.environ/NVIDIA_API_KEY";
          };
        }

        {
          model_name = "deepseek-pro";
          # DeepSeek Pro: Added as requested for advanced logic and coding.
          litellm_params = {
            model = "nvidia_nim/deepseek-ai/deepseek-v4-pro";
            api_key = "os.environ/NVIDIA_API_KEY";
          };
        }

        # --- LIGHTWEIGHTS ---
        {
          model_name = "llama-8b";
          # Llama 3.1 8B: Blazing fast for quick scripts and simple formatting.
          litellm_params = {
            model = "nvidia_nim/meta/llama-3.1-8b-instruct";
            api_key = "os.environ/NVIDIA_API_KEY";
          };
        }

        {
          model_name = "mistral-nemo";
          # Mistral Nemo 12B: Fast, smart middle-ground for everyday tasks.
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
