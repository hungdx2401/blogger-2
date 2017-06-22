package katy.bordercollie.entity;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;
import com.googlecode.objectify.annotation.Index;
import com.googlecode.objectify.annotation.Unindex;

@Entity
public class Article {
	@Id
	private String id;
	@Unindex
	private String alias;
	@Unindex
	private String title;
	@Index
	private String categoryId;
	@Index
	private String eventId;
	@Unindex
	private String description;
	@Unindex
	private ArrayList<String> photos;
	@Unindex
	private String content;
	@Unindex
	private ArrayList<String> tags;
	@Index
	private long doc;
	@Index
	private String createdBy;
	@Unindex
	private long updated;

	/**
	 * 3. Mới tạo. <br>
	 * 2. Đã index. <br>
	 * 1. Đã xử lý tag. <br>
	 * 0. Đã xóa. <br>
	 */
	@Index
	private int status;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getAlias() {
		return alias;
	}

	public void setAlias(String alias) {
		this.alias = alias;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(String categoryId) {
		this.categoryId = categoryId;
	}

	public String getEventId() {
		return eventId;
	}

	public void setEventId(String eventId) {
		this.eventId = eventId;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public ArrayList<String> getPhotos() {
		if (this.photos == null) {
			this.photos = new ArrayList<String>();
		}
		return photos;
	}

	public void setPhotos(ArrayList<String> photos) {
		this.photos = photos;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public ArrayList<String> getTags() {
		if (this.tags == null) {
			this.tags = new ArrayList<String>();
		}
		return tags;
	}

	public void setTags(ArrayList<String> tags) {
		this.tags = tags;
	}

	public long getDoc() {
		return doc;
	}

	public void setDoc(long doc) {
		this.doc = doc;
	}

	public long getUpdated() {
		return updated;
	}

	public void setUpdated(long updated) {
		this.updated = updated;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}

	public String getFormatedDoc() {
		if (this.doc == 0) {
			return null;
		}
		Calendar cal = Calendar.getInstance();
		cal.setTimeInMillis(this.doc);
		SimpleDateFormat formater = new SimpleDateFormat("dd/MM/yyyy");
		return formater.format(cal.getTime());
	}

}
