package model

import "time"

type Task struct {
	ID        uint      `json:"id"         gorm:"primaryKey"`
	Title     string    `json:"title"                        grom:"not null"`
	CreatedAt time.Time `json:"created_at"`
	UpdatedAt time.Time `json:"updated_at"`
	User      User      `json:"user"                         grom:"foreignKey:UserId; constraint:OnDelete:CASCADE"`
	UserId    uint      `json:"user_id"                      grom:"not null"`
}

type TaskResponse struct {
	ID        uint      `json:"id"         grom:"primaryKey"`
	Title     string    `json:"title"      grom:"not null"`
	CreatedAt time.Time `json:"created_at"`
	UpdatedAt time.Time `json:"updated_at"`
}
