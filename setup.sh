#/bin/bash
echo 'export DOTNET_CLI_TELEMETRY_OPTOUT=1' >> /home/$USER/.bashrc

wget https://dl.google.com/android/repository/commandlinetools-linux-11076708_latest.zip
mkdir -p /home/$USER/android-sdk/cmdline-tools/latest && unzip commandlinetools-linux-11076708_latest.zip -d /home/$USER/android-sdk/cmdline-tools/latest
mv /home/$USER/android-sdk/cmdline-tools/latest/cmdline-tools/* /home/$USER/android-sdk/cmdline-tools/latest/
rm -fr /home/$USER/android-sdk/cmdline-tools/latest/cmdline-tools/

echo "export ANDROID_HOME='/home/$USER/android-sdk'" >> /home/$USER/.bashrc
echo 'export PATH="$PATH:$ANDROID_HOME:$ANDROID_HOME/cmdline-tools:$ANDROID_HOME/cmdline-tools/latest:$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/platform-tools"' >> /home/$USER/.bashrc


wget 'https://builds.dotnet.microsoft.com/dotnet/Sdk/9.0.308/dotnet-sdk-9.0.308-linux-x64.tar.gz'
export DOTNET_SHA_SUM="3aacff096524a1dae9bc035f71a6805fa7ec3430d395771fc1c85505165a78361ce2cc9c9c35433376e5c30aec37e2eb2e77de0a6ba7ddd7dc6053baf2c2709a"
sha512sum ./dotnet-sdk-9.0.308-linux-x64.tar.gz | grep $DOTNET_SHA_SUM

mkdir -p /home/$USER/dotnet && tar zxf dotnet-sdk-9.0.308-linux-x64.tar.gz -C /home/$USER/dotnet

echo 'export DOTNET_ROOT="/home/$USER/dotnet"' >> /home/$USER/.bashrc
echo 'export PATH="$PATH:/home/$USER/dotnet"' >> /home/$USER/.bashrc

sudo ln -s /home/user/dotnet/dotnet /usr/local/bin/dotnet

sudo dnf install java-21-openjdk-devel.x86_64

. /home/$USER/.bashrc

echo """PS1='\\e[32m\\\$ \\e[0m'""" >> ~/.bashrc

sdkmanager "platforms;android-35" "platform-tools" "build-tools;35.0.0" "emulator" "system-images;android-34;default;x86_64" "cmdline-tools;11.0"
#sdkmanager "platforms;android-35" "platform-tools" "build-tools;35.0.0" "emulator" "system-images;android-34;default;x86_64" "cmdline-tools;11.0"
sdkmanager --licenses
