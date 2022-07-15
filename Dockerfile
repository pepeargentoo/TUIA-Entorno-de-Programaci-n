FROM bash:4.4
COPY . /user/Dani
WORKDIR /user/Dani
CMD ["bash", "main.sh"]