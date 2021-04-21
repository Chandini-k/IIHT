import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class MentorServiceService {

  skills
  authurl = 'http://localhost:5000/api/auth/'
  adminurl='http://localhost:1998/api/Admin/'
  mentorurl='http://localhost:8966/api/'
  userurl='http://localhost:2654/api/'
  constructor(private http: HttpClient) { }

  getSkills()
  {
    let header = new HttpHeaders({ 'Content-Type': 'application/json', 'responseType':'text' })
    let options = { headers: header }
    return this.http.get(this.mentorurl+"mentor/getSkills",options)
  }
  getMyCourses(id:any)
  {
    let body = id
    let header = new HttpHeaders({ 'Content-Type': 'application/json', 'responseType':'text' })
    let options = { headers: header }
    return this.http.get(this.mentorurl+"mentorTwo/getCoursesById/"+body,options)
  }
  addCourse(course:any)
  {
    let body = JSON.stringify(course.value)
    let header = new HttpHeaders({ 'Content-Type': 'application/json', 'responseType':'text' })
    let options = { headers: header }
    return this.http.post(this.mentorurl+"mentor/addCourse",body,options)
  }
  getMySubscribers(id:any)
  {
    let body = id
    let header = new HttpHeaders({ 'Content-Type': 'application/json', 'responseType':'text' })
    let options = { headers: header }
    return this.http.get(this.mentorurl+"mentorTwo/getMySubscribers/"+body,options)
  }
  updateTrainingStatus(id:any,status:boolean)
  {
    let body = id+"/"+status
    let header = new HttpHeaders({ 'Content-Type': 'application/json', 'responseType':'text' })
    let options = { headers: header }
    return this.http.put(this.mentorurl+"training/updateTrainingStatus/"+body,options)
  }
}
