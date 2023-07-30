SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
if [ -e "${SCRIPT_DIR}/params.bash" ]; then
    source "${SCRIPT_DIR}/params.bash"
fi

DISTRO="${DISTRO:-bookworm}"

PKG_VERSION_FIREFISH="${PKG_VERSION_FIREFISH:-1.0.3}"
PKG_VERSION_DEB="${PKG_VERSION_DEB:-"d$(date +%Y%m%d%H%M%S)-alpha"}"

NODE_MAJOR_VERSION="${NODE_MAJOR_VERSION:-20}"

FIREFISH_SOURCE_GIT_REPO="${FIREFISH_SOURCE_GIT_REPO:-"https://git.joinfirefish.org/firefish/firefish.git"}"

PKG_VERSION="${PKG_VERSION_FIREFISH}-${PKG_VERSION_DEB}"

FIREFISH_SOURCE_VERSION="v${PKG_VERSION_FIREFISH}"
WORK_DIR="${WORK_DIR:-"$SCRIPT_DIR/.."}"

SOURCE_DIR="${WORK_DIR}/source"
INSTALL_DIR="${WORK_DIR}/install"
DEST_DIR="${WORK_DIR}/dest"
