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
#ifndef PLAYER_H
#define PLAYER_H

#include <QTimer>
#include <QTime>
#include <QLabel>


#ifdef GST_USE
#include <QGst/Pipeline>
#include <QGst/Ui/VideoWidget>

#else
#include <QWidget>
#endif
#define ERROR_DELAY 1000
class Player 
#ifdef GST_USE
	: public QGst::Ui::VideoWidget
#else
	: public QWidget

#endif
{
    Q_OBJECT
public:
    Player(QWidget *parent = 0);
    ~Player();



};

#endif
