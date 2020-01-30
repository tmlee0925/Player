/*
    Copyright (C) 2010 Marco Ballesio <gibrovacco@gmail.com>
    Copyright (C) 2011 Collabora Ltd.
      @author George Kiagiadakis <george.kiagiadakis@collabora.co.uk>

    This library is free software; you can redistribute it and/or modify
    it under the terms of the GNU Lesser General Public License as published
    by the Free Software Foundation; either version 2.1 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Lesser General Public License for more details.

    You should have received a copy of the GNU Lesser General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/
#include "player.h"
#include <QDir>
#include <QUrl>
#include <QSize>

#ifdef GST_USE
#include <QGlib/Connect>
#include <QGlib/Error>
#include <QGst/Pipeline>
#include <QGst/ElementFactory>
#include <QGst/Bus>
#include <QGst/Message>
#include <QGst/Query>
#include <QGst/ClockTime>
#include <QGst/Event>
#include <QGst/StreamVolume>
#include <QGst/Parse>
#endif // GST_USE

//#include "Env/CTMEnv.h"


//#include <QtConcurrent/QtConcurrent>

Player::Player(QWidget *parent)
#ifdef GST_USE
	: QGst::Ui::VideoWidget(parent)
#else
	: QWidget( parent )
#endif

{
/*
	m_pLabel = new QLabel(this);
	m_pLabel->hide();
	//setStyleSheet("background-color: gray;");
	
#ifdef PLAYER_CAPTION_USE
	
	m_pCamlabel = new QLabel(parent);
	//m_pCamlabel = new QLabel(this);
	//m_pCamlabel->move(CAMLABEL_POSITION_X, CAMLABEL_POSITION_Y);
	//m_pCamlabel->resize(CAMLABEL_FRAME_WIDTH, CAMLABEL_FRAME_HEIGHT);
	
	m_pCamlabel->setStyleSheet("background-color: black;");
	m_pCamlabel->setGeometry(CAMLABEL_POSITION_X, CAMLABEL_POSITION_Y, CAMLABEL_FRAME_WIDTH, CAMLABEL_FRAME_HEIGHT);
	Qt::WindowFlags flags = Qt::WindowStaysOnTopHint;
	m_pCamlabel->setWindowFlags(flags);
	QPalette palette;
	QBrush brush(QColor(255, 255, 255, 255));
	brush.setStyle(Qt::SolidPattern);
	//palette.setBrush(QPalette::Active, QPalette::WindowText, brush);
	palette.setBrush(QPalette::Inactive, QPalette::WindowText, brush);
	

	// font setting
	QFont font;
	font.setPointSize(11);
	font.setBold(true);
	font.setWeight(75);

	m_pCamlabel->setPalette(palette);
	m_pCamlabel->setFont(font);
	
	//m_pCamlabel->setText("#-#");
	//m_pCamlabel->setWindowModality(Qt::WindowModality::NonModal);
	
	//m_pCamlabel->setEnabled();
	m_pCamlabel->show();
	//m_pCamlabel->setPalette(palette);
	//m_pCamlabel->setFont(font);
#endif
	//this timer is used to tell the ui to change its position slider & label
    //every 100 ms, but only when the pipeline is playing
#ifdef GST_USE
	connect(&m_positionTimer, SIGNAL(timeout()), this, SIGNAL(positionChanged()));
	//connect(&m_ErrTimer, SIGNAL(timeout()), this, SIGNAL(slotReplay()));

	//onStateChanged(m_iIdx); //set the controls to their default state
#endif
*/
}

Player::~Player()
{
	/*
#ifdef GST_USE
    if (m_pipeline) {
        m_pipeline->setState(QGst::StateNull);
        stopPipelineWatch();
    }
#endif
*/
}


