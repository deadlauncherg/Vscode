FROM codercom/code-server:latest

ENV PORT=10000

EXPOSE 10000

CMD ["--bind-addr", "0.0.0.0:10000", "--auth", "password", "/home/coder/project"]
