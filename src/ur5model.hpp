#pragma once

#include <QObject>

#ifndef Q_MOC_RUN
  #include <rwlibs/task.hpp>
  #include <rw/models/WorkCell.hpp>
  #include <rw/kinematics/State.hpp>
  #include <rw/kinematics/MovableFrame.hpp>
  #include <rwsim/dynamics/DynamicWorkCell.hpp>
#endif

#include <QtGui>
#include <QTimer>
#include <rws/RobWorkStudioPlugin.hpp>

#include "ui_ur5model.h"


/**
 * @brief A plugin for UR5 modelling.
 */
class UR5Model : public rws::RobWorkStudioPlugin {
  Q_OBJECT
  Q_PLUGIN_METADATA(IID "UR5Model" FILE "ur5model.json")
  Q_INTERFACES(rws::RobWorkStudioPlugin)

public:
  //! @brief Constructor.
  UR5Model();

  //! @brief Destructor.
  virtual ~UR5Model();

  //! @copydoc rws::RobWorkStudioPlugin::open(rw::models::WorkCell* workcell)
  virtual void open(rw::models::WorkCell* workcell);

  //! @copydoc rws::RobWorkStudioPlugin::close()
  virtual void close();

  //! @copydoc rws::RobWorkStudioPlugin::initialize()
  virtual void initialize();

  /**
   * @brief Listens for events regarding opening and closing of dynamic workcell.
   * @param event [in] the event id
   */
  void genericEventListener(const std::string& event);

private slots:
  void update();

private:
  Ui::UR5ModelWidget _ui;
  rw::models::WorkCell* _wc;
  rwsim::dynamics::DynamicWorkCell::Ptr _dwc;
  rw::kinematics::State _state;
  QTimer *_updateStateTimer;
};
