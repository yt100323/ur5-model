#include "ur5model.hpp"

#include <rw/common/Ptr.hpp>
#include <rw/common/Log.hpp>
#include <rw/math/Math.hpp>
#include <rw/math/Transform3D.hpp>
#include <rws/RobWorkStudio.hpp>
#include <rwsim/dynamics/DynamicWorkCell.hpp>
#include <boost/bind.hpp>

#include <QMessageBox>


using namespace std;
using namespace rws;
using namespace rw::common;
using namespace rw::math;
using namespace rw::models;
using namespace rw::kinematics;
using namespace rwsim::dynamics;


UR5Model::UR5Model() :
RobWorkStudioPlugin("UR5Model", QIcon(":/ur5model.png")) {

  _ui.setupUi(this);

  _updateStateTimer = new QTimer(this);
  connect(_updateStateTimer, SIGNAL(timeout()), this, SLOT(update()));
}


UR5Model::~UR5Model() {
}


void UR5Model::initialize() {
  getRobWorkStudio()->genericEvent().add(boost::bind(&UR5Model::genericEventListener, this, _1), this);
}


void UR5Model::open(WorkCell *workcell) {
  try {
    Math::seed(TimerUtil::currentTimeUs());

    _wc = workcell;
    _state = _wc->getDefaultState();

  } catch (const rw::common::Exception& e) {
    QMessageBox::critical(NULL, "RW Exception", e.what());
  }
}


void UR5Model::close() {
}


void UR5Model::genericEventListener(const std::string &event) {
  if (event == "DynamicWorkCellLoaded") {

    DynamicWorkCell::Ptr dwc = getRobWorkStudio()->getPropertyMap().get<DynamicWorkCell::Ptr>("DynamicWorkcell", NULL);

    if (dwc == NULL) {
      log().error() << "Could not load dynamic workcell from propertymap!" << std::endl;
      return;
    }

    _dwc = dwc;
  }
}


void UR5Model::update() {

}


//Q_EXPORT_PLUGIN(UR5Model);
